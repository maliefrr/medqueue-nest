import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { hash, genSalt } from 'bcrypt';

export interface RegistrationBody {
  id?: string;
  nama: string;
  email: string;
  password: string;
  tempat_lahir: string;
  tgl_lahir: Date;
  no_bpjs?: string;
  gender: string;
  no_nik: string;
  gol_darah?: string;
  no_telepon: string;
  role: 'ADMIN' | 'PATIENT';
}

export interface registerResponse {
  message: string;
  data: RegistrationBody;
}

@Injectable()
export class AuthService {
  constructor(private prismaService: PrismaService) {}

  async register(registerBody: RegistrationBody) {
    const salt = await genSalt(10);
    const hashedPassword = await hash(registerBody.password, salt);
    await this.prismaService.user.create({
      data: {
        email: registerBody.email,
        gender: registerBody.gender,
        gol_darah: registerBody.gol_darah,
        nama: registerBody.nama,
        no_bpjs: registerBody.no_bpjs,
        no_nik: registerBody.no_nik,
        no_telepon: registerBody.no_telepon,
        tempat_lahir: registerBody.tempat_lahir,
        tgl_lahir: registerBody.tgl_lahir,
        role: registerBody.role,
        password: hashedPassword,
      },
    });
  }
}
