import { EntityRepository } from 'typeorm';
import { EventLogAccess } from 'src/domain/entities/event-log-access.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';

@EntityRepository(EventLogAccess)
export class EventLogAccessRepository extends BaseRepository<EventLogAccess> {

}