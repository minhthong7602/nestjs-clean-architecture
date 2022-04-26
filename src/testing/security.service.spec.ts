import { SecurityService } from "../application/core/securities/security.service";

describe('Security Service', () => {
   const securityService = new SecurityService();

   it('encryptPassword: Check plain password same password enscript', async () => {
    const plainPassword = "123456";
    const encryptObj = await securityService.encryptPassword(plainPassword);
    expect(encryptObj.hash).toBe(plainPassword);
   });

   it('encryptPassword & hashPassword: when user enter correct password', async () => {
     const encryptObj = await securityService.encryptPassword('123456');
     const hashPassWord = await securityService.hashPassword('123456', encryptObj.salt);
     expect(encryptObj.hash).toBe(hashPassWord);
   });

   it('encryptPassword & hashPassword: when user enter incorrect password', async () => {
    const encryptObj = await securityService.encryptPassword('123456');
    const hashPassWord = await securityService.hashPassword('12345', encryptObj.salt);
    expect(encryptObj.hash === hashPassWord).toBeFalsy();
   });

   it('checkPasswordWithSalt: when user enter correct password', async () => {
    const encryptObj = await securityService.encryptPassword('123456');
    const isCorrectPass = await securityService.checkPasswordWithSalt('123456', encryptObj.hash);
    expect(isCorrectPass).toBeTruthy();
   });

   it('checkPasswordWithSalt: when user enter incorrect password', async () => {
    const encryptObj = await securityService.encryptPassword('123456');
    const isCorrectPass = await securityService.checkPasswordWithSalt('12345', encryptObj.hash);
    expect(isCorrectPass).toBeFalsy();
   });
});