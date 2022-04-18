import { EntityRepository } from 'typeorm';
import { Role } from 'src/domain/entities/roles.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';

@EntityRepository(Role)
export class RoleRepostiory extends BaseRepository<Role> {
}