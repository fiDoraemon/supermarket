import com.jinggege.dao.RegisterAndLogin;
import com.jinggege.dao.SupplierManage;
import com.jinggege.domain.Supplier;
import com.jinggege.domain.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class mybaitis {
    private String context = "applicationContext.xml";
    private ApplicationContext ac = new ClassPathXmlApplicationContext(context);

    @Test
    public void Userlogin(){
        RegisterAndLogin registerAndLogin = (RegisterAndLogin) ac.getBean("registerAndLogin");
        User user = new User();
        user.setUsername("jinggege");
        user.setPassword("123456");
        user.setName("靖哥哥");
        user.setIdentity_id("123456789");
        int i = registerAndLogin.addUser(user);
        System.out.println(i);
    }
    @Test
    public void selectUserByUsername(){
        RegisterAndLogin registerAndLogin = (RegisterAndLogin) ac.getBean("registerAndLogin");
        User user = registerAndLogin.selectUserByUsername("jinggege");
        System.out.println(user.toString());
    }

    @Test
    public void supplierInfo(){
        SupplierManage sm = (SupplierManage) ac.getBean("supplierManage");
        List<Supplier> suppliers = sm.selectAll();
        for (Supplier supplier : suppliers) {
            System.out.println(supplier);
        }
    }
    @Test
    public void addSupplier(){
        SupplierManage sm = (SupplierManage) ac.getBean("supplierManage");
        Supplier supplier = new Supplier();
        supplier.setSupplier("1");
        supplier.setContacts("2");
        supplier.setAddress("3");
        supplier.setPhone("4");
        int i = sm.insertSupplier(supplier);

    }


}
