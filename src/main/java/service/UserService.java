package service;

import entity.User;
import storage.InMemoryUserStorage;

public class UserService {
    private InMemoryUserStorage userStorage = new InMemoryUserStorage();

    public boolean add(User user){
        if (userStorage.existByUsername(user.getUsername())){
            return false;
        } else {
            userStorage.save(user);
            return true;
        }
    }

    public User findByUsername (String username){
        if (userStorage.existByUsername(username)){
            return userStorage.getByUsername(username);
        }
        return null;
    }
}
