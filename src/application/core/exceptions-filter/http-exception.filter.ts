import { ExceptionFilter, Catch, HttpException, ArgumentsHost } from '@nestjs/common';
import { Response, Request } from 'express';
import { InjectRepository } from '@nestjs/typeorm';
import { HttpExceptionAccessRepository} from 'src/infrastructure/repositories/http-exception-access.repository';
import { HttpExceptionAccess } from 'src/domain/entities/http-exception-access.entity';
import { RESPONSE_STATUS } from 'src/application/core/configs/response-status.config';
@Catch(HttpException)
export class HttpExceptionFilter implements ExceptionFilter {
    constructor(
      @InjectRepository(HttpExceptionAccessRepository)
      private readonly httpExceptionAccessRepository: HttpExceptionAccessRepository
    ) {}
    catch(exception: HttpException, host: ArgumentsHost) {
        const ctx = host.switchToHttp();
        const response = ctx.getResponse<Response>();
        const request = ctx.getRequest<Request>();
        const status = exception.getStatus();
        const error = exception.message;
        const exceptionAccess = new HttpExceptionAccess();
        exceptionAccess.api_method = request.method;
        exceptionAccess.api_url = request.url;
        exceptionAccess.ip = request.ip;
        exceptionAccess.api_error = error;
        exceptionAccess.api_status = status;
        this.httpExceptionAccessRepository.insertData(exceptionAccess);
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