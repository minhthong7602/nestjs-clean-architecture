import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
  return 'Hello World Jenkins <3 NestJs & Docker! Develop Branch';
  }
}
