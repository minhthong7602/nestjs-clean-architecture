import { EntityRepository } from 'typeorm';
import { Users } from 'src/domain/entities/user.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';

@EntityRepository(Users)
export class UsersRepository extends BaseRepository<Users> {
  public async getByUserName(username: string) : Promise<Users> {
    return this.findOne({ where: {username: username}});
  }
}