import { Injectable } from '@nestjs/common';
import { SecurityService } from 'src/application/core/securities/security.service';
import { JwtService } from '@nestjs/jwt';
import { UsersRepository } from 'src/infrastructure/repositories/users.repository';
import { InjectRepository } from '@nestjs/typeorm';
@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(UsersRepository)
    private readonly usersRepository: UsersRepository,
    private jwtService: JwtService,
    private securityService: SecurityService) {

  }

  async validateUser(username: string, password: string) : Promise<any> {
    const user = await this.usersRepository.getByUserName(username);
    if(user) {
      const isValidatePass = await this.securityService.checkPasswordWithSalt(password, user.password, user.password_salt);
      if(isValidatePass) {
        return {
          userId: user.id,
          username: user.username,
          roleId: user.role_id
        }
      }
    }
    return null;
  }

  async login(user: any) {
    const payload = { username: user.username, sub: user.userId, role: user.roleId };
    return {
      access_token: this.jwtService.sign(payload)
    }
  }
}