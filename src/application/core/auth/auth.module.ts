import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { jwtConstants } from './auth.config';
import { AuthService } from './auth.service';
import { UsersRepository } from 'src/infrastructure/repositories/users.repository';
import { JwtStrategy } from './jwt.strategy';
import { JwtAuthGuard } from './jwt-auth.guard';
import { SecurityService } from '../securities/security.service';
@Module({
  imports: [
    TypeOrmModule.forFeature([UsersRepository]),
    PassportModule.register({
    session: true
  }),
  JwtModule.register({
    secret: jwtConstants.secret,
    signOptions: { expiresIn: jwtConstants.expiresIn }
  })
 ],
 providers: [ AuthService, SecurityService, JwtStrategy, JwtAuthGuard ],
 exports: [ AuthService ]
})

export class AuthModule {}