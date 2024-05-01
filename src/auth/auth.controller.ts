import { Controller, Post } from '@nestjs/common';

@Controller('')
export class AuthController {
  @Post('/register')
  userRegister(): string {
    return 'User Register Success';
  }
  @Post('/register/admin')
  adminRegister(): string {
    return 'Admin Register Success';
  }
}
