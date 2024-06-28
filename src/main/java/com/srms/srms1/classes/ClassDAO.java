package com.srms.srms1.classes;

import java.util.List;

public interface ClassDAO {

    public void insertClass(Class cls);
    public List<Class> selectAllClasses();
    public void deleteClass(int id);
    public void updateClass(int id);


}
