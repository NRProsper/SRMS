package com.srms.srms1.course;

import java.util.List;

public interface CategoryDAO {

    public void insertCategory(Category category);
    public List<Category> selectAllCategories();
    public Category getCategory(int id);
    public void updateCategory(int id ,String title);
    public boolean deleteCategory(int id);

}
