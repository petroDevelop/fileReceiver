import com.petrodata.microseism.MsProject
import com.petrodata.microseism.MsRole
import com.petrodata.microseism.MsUser

class BootStrap {

    def init = { servletContext ->
        if(MsRole.count()==0){
            ['ROLE_ADMIN','ROLE_USER'].each{
                new MsRole(roleName:it,remark: it).save(flush: true);
            }
        }
        if(MsUser.count()==0){
            ['admin:ROLE_ADMIN','user:ROLE_USER'].each{
                def list=it.tokenize(":");
                new MsUser(userName: list[0],userPwd: list[0],rigName:'Well-01',msRole: MsRole.findByRoleName(list[1]) ).save(flush: true);
            }
        }
        if(MsProject.count()==0){
            ['project1','project2','project3'].each{
                new MsProject(projectName: it,remark: it,rigName:'Well-01',msUser: MsUser.findByUserName('user')).save(flush: true);
            }
        }
    }
    def destroy = {
    }
}
