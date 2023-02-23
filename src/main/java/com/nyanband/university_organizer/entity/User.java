package com.nyanband.university_organizer.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "users",
        uniqueConstraints = {@UniqueConstraint(columnNames = "email")}
)
public class User extends BaseEntity {
    String email;

    String password;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    List<Role> roles;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    List<Course> courses;

//    @OneToOne(mappedBy =  "userSettings",fetch =  FetchType.LAZY)
//    UserSettings userSettings;

    public User(Long id) {
        super(id);
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }
}
