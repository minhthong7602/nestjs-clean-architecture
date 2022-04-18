import { Catch, ArgumentsHost, HttpException } from '@nestjs/common';
import { BaseExceptionFilter } from '@nestjs/core';
import { HttpExceptionAccessRepository } from 'src/infrastructure/repositories/http-exception-access.repository';
import { InjectRepository } from '@nestjs/typeorm';
import { HttpExceptionAccess } from 'src/domain/entities/http-exception-access.entity';
import { Response, Request } from 'express';
@Catch()
export class AllExceptionsFilter extends BaseExceptionFilter {
  constructor(
    @InjectRepository(HttpExceptionAccessRepository)
    private readonly httpExceptionAccessRepository: HttpExceptionAccessRepository
  ) {
    super();
  }
  catch(exception: any, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const request = ctx.getRequest<Request>();
    if(exception.constructor.name === 'TypeError') {
      const exceptionAccess = new HttpExceptionAccess();
      exceptionAccess.api_method = request.method;
      exceptionAccess.api_url = request.url;
      exceptionAccess.ip = request.ip;
      exceptionAccess.api_error = exception.message;
      exceptionAccess.api_status = 500;
      this.httpExceptionAccessRepository.insertData(exceptionAccess);
    }
    super.catch(exception, host);
  }
}