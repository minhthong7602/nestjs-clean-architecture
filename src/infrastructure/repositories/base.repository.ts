import { BaseEntity } from 'src/domain/entities/base.entity';
import { Repository, FindManyOptions  } from 'typeorm';

export class BaseRepository<T> extends Repository<T>   {
    public async getAll(options?: FindManyOptions<T>): Promise<T[]> {
        return this.find(options);
    }

    public async getById(id: number): Promise<T> {
        return this.findOne(id);
    }

    public async insertData(data: T) {
        return this.saveChange(data);
    }

    public async updateData(data: T) {
        return this.saveChange(data);
    }

    public async saveChange(data: T) {
        return this.save(data).then((dataResponse: T)=> {
            let dataEvent = (data as unknown as BaseEntity);
            if(dataResponse != null && dataEvent?.domainEvents?.length > 0) {
                let events = dataEvent.domainEvents;
                for(let event of events) {
                    dataEvent.apply(event);
                }
                dataEvent.commit();
                return dataResponse;
            }
        });
    }
}
