import { ApiProperty } from "@nestjs/swagger";

export const RESPONSE_STATUS = {
  SUCCESSED: 'SUCCESSED',
  ERROR: 'ERROR'
};

export class ResponseModel <T> {
  @ApiProperty()
  status: string;

  @ApiProperty()
  message: string;

  data: T;

  constructor(status: string = RESPONSE_STATUS.SUCCESSED, message: string = '', data: T = null) {
    this.status = status;
    this.message = message;
    this.data = data;
  }
}