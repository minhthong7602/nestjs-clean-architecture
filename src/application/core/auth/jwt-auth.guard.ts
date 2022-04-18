import { Injectable, ExecutionContext, UnauthorizedException } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { Reflector } from '@nestjs/core';
import { ROLE_CONIFG } from './auth.config';

@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {
  constructor(
    private reflector: Reflector
  ) {
    super();
  }
  
  async canActivate(context: ExecutionContext) {
    const roles = this.reflector.get<number[]>('roles', context.getHandler());
    // For anonymous user
    if(roles && roles.length > 0 && roles.indexOf(ROLE_CONIFG.anonymous) > -1) {
      return true;
    }
   
    // For logged user
    const result = (await super.canActivate(context)) as boolean;
    if(result && (!roles || (roles && roles.length > 0 && roles.indexOf(ROLE_CONIFG.logged) > -1))) {
      return true;
    }

    // For special role
    const request = context.switchToHttp().getRequest();
    if(result && roles && roles.length > 0 && roles.indexOf(request.user.role) > -1) {
      return true;
    }
    throw new UnauthorizedException();
  }
}