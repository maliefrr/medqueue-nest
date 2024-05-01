import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
import { AuthModule } from './auth/auth.module';
import { PatientModule } from './patient/patient.module';
import { AdminModule } from './admin/admin.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [UserModule, AuthModule, PatientModule, AdminModule, PrismaModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
