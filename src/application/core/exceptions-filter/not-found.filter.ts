import { ArgumentsHost, Catch, ExceptionFilter, HttpException, HttpStatus } from "@nestjs/common";
import { RESPONSE_STATUS } from "../configs/response-status.config";
import { Response, Request } from 'express';

export class NotFoundException extends HttpException {
  constructor(message: string) {
    super(message, HttpStatus.NOT_FOUND);
  }
}

@Catch(NotFoundException) 
export class NotFoundExceptionFilter implements ExceptionFilter {
  constructor() {}

  catch(exception: NotFoundException, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    const request = ctx.getRequest<Request>();
    const status = exception.getStatus();
    const error = exception.message;
    console.log('Request Url:', request.url);
    console.log('NotFoundException:', error);

    response
          .status(status)
          .json({
              statusCode: status,
              status: RESPONSE_STATUS.ERROR,
              timestamp: new Date().toISOString(),
              path: request.url,
              message: error
          });
  }
}