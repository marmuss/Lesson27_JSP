package storage;

import entity.User;

import java.util.ArrayList;
import java.util.List;

public class InMemoryUserStorage {
    public static List<User> userList = new ArrayList<User>();

    public void save(User user){
        userList.add(user);
    }

    public User getByUsername (String username){
        for (User user : userList){
            if (user.getUsername().equals(username)){
                return user;
            }
        }
        return null;
    }

    public boolean existByUsername (String username){
        for (User user : userList){
            if (user.getUsername().equals(username.toLowerCase())){
                return true;
            }
        }
        return false;
    }
}
