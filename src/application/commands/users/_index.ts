import { RegisterUserCommand, RegisterUserHandler  } from './register.command';
import { ChangePasswordHandler, ChangePasswordCommand } from './change-password.command';
import { LoginHandler, LoginCommand } from './login.command';


export const UsersCommandHandlers = [
  RegisterUserHandler,
  ChangePasswordHandler,
  LoginHandler
];

export {
  RegisterUserCommand,
  ChangePasswordCommand,
  LoginCommand
};