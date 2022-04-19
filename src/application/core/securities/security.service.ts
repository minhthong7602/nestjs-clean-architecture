import { Injectable } from '@nestjs/common';
import * as bcrypt from 'bcrypt';
@Injectable()
export class SecurityService {
  saltRounds = 10;

  encryptPassword(plainPassword: string) : Promise<any> {
    return new Promise((resolve) => {
      bcrypt.genSalt(this.saltRounds, (err, salt) => {
        bcrypt.hash(plainPassword, salt, (err, hash) => {
            resolve({
              hash,
              salt
            })
        });
    });
    })
  }

  hashPassword(plainPassword: string, salt: string) : Promise<string> {
    return new Promise((resolve) => {
      bcrypt.hash(plainPassword, salt, (err, hash) => {
        resolve(hash);
    });
    })
  }

  checkPasswordWithSalt(plainPassword: string, hash: string) : Promise<boolean> {
    return new Promise((resolve) => {
      bcrypt.compare(plainPassword, hash, (err, result) => {
        if(err) {
          resolve(false);
          return;
        }
        resolve(result);
      });
    })
  }
}