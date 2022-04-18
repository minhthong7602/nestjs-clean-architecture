import { CommandHandler, ICommandHandler } from '@nestjs/cqrs';
import { ResponseModel, RESPONSE_STATUS } from 'src/application/core/configs/response-status.config';
import { AuthService } from 'src/application/core/auth/auth.service';
import { ApiProperty } from '@nestjs/swagger';
import { Users } from 'src/domain/entities/user.entity';

export class LoginCommand {
  @ApiProperty()
  username: string;
  
  @ApiProperty()
  password: string;
  constructor(username: string, password: string) {
    this.username = username;
    this.password = password;
  }
}

@CommandHandler(LoginCommand)
export class LoginHandler implements ICommandHandler<LoginCommand> {
  constructor(private authService: AuthService) {

  }

  public async execute(command: LoginCommand) : Promise<ResponseModel<{ user: Users, token: {
    access_token: string
  }}>> {
    const response = new ResponseModel<{ user: Users, token: {
      access_token: string
    }}>();
    const user = await this.authService.validateUser(command.username, command.password);
    if(!user) {
      response.status = RESPONSE_STATUS.ERROR;
      response.message = 'Login faild';
      return response;
    }
    response.data = {
      user,
      token: await this.authService.login(user)
    }
    response.status = RESPONSE_STATUS.SUCCESSED;
    response.message = 'Login successfully';
    return response;
  }
}