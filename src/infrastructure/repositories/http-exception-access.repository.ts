import { EntityRepository } from 'typeorm';
import { HttpExceptionAccess } from 'src/domain/entities/http-exception-access.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';

@EntityRepository(HttpExceptionAccess)
export class HttpExceptionAccessRepository extends BaseRepository<HttpExceptionAccess> {

}