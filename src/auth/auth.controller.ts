import { BadRequestException, Body, Controller, Post } from '@nestjs/common';
import {
  AuthService,
  RegistrationBody,
  registerResponse,
} from './auth.service';
import moment from 'moment';

@Controller('')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('/register')
  async userRegister(
    @Body() data: RegistrationBody,
  ): Promise<registerResponse> {
    if (
      !data.email ||
      !data.gender ||
      !data.nama ||
      !data.no_nik ||
      !data.no_telepon ||
      !data.password ||
      !data.tempat_lahir ||
      !data.tgl_lahir
    ) {
      throw new BadRequestException();
    }
    const role = 'PATIENT';
    const tgl_lahir = moment(data.tgl_lahir).format('YYYY-MM-DD');

    if (!moment(tgl_lahir, 'YYYY-MM-DD', true).isValid()) {
      throw new BadRequestException('Invalid date');
    }

    await this.authService.register({
      nama: data.nama,
      email: data.email,
      no_nik: data.no_nik,
      gender: data.gender,
      no_telepon: data.no_telepon,
      tgl_lahir: new Date(tgl_lahir),
      tempat_lahir: data.tempat_lahir,
      gol_darah: data.gol_darah,
      no_bpjs: data.no_bpjs,
      password: data.password,
      role: role,
    });

    return {
      message: 'Data has been successfully added to the database',
      data,
    };
  }

  @Post('/register/admin')
  adminRegister(): string {
    return 'Admin Register Success';
  }
}
