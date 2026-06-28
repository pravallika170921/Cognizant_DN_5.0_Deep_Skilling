# Hands-on 4: Difference Between JPA, Hibernate and Spring Data JPA

## Aim

To understand the difference between JPA, Hibernate and Spring Data JPA by comparing their usage in code.

## What I Understood

In this hands-on, I understood that **JPA**, **Hibernate**, and **Spring Data JPA** are related technologies, but they serve different purposes.

**JPA (Java Persistence API)** is a specification that defines how Java objects should be stored, retrieved, and managed in a database. It only provides the rules and annotations but does not contain an actual implementation.

**Hibernate** is one of the most popular implementations of JPA. It follows the JPA specification and performs the actual database operations such as insert, update, delete, and fetch. Hibernate allows developers to work with Java objects instead of writing SQL queries manually.

**Spring Data JPA** is built on top of JPA and Hibernate. It further simplifies database programming by reducing boilerplate code. It provides repository interfaces like `JpaRepository` that automatically implement common CRUD operations and also manages transactions efficiently.

---

## Hibernate Code

```java
public Integer addEmployee(Employee employee){
   Session session = factory.openSession();
   Transaction tx = null;
   Integer employeeID = null;

   try {
      tx = session.beginTransaction();
      employeeID = (Integer) session.save(employee);
      tx.commit();
   } catch (HibernateException e) {
      if (tx != null)
         tx.rollback();
      e.printStackTrace();
   } finally {
      session.close();
   }

   return employeeID;
}
```

### What I Noticed

In Hibernate, we need to manually:

* Open the session
* Begin the transaction
* Save the object
* Commit or rollback the transaction
* Close the session

Although Hibernate provides complete control over database operations, it requires writing more code.

---

## Spring Data JPA Code

```java
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}
```

```java
@Autowired
private EmployeeRepository employeeRepository;

@Transactional
public void addEmployee(Employee employee) {
    employeeRepository.save(employee);
}
```

### What I Noticed

In Spring Data JPA, most of the boilerplate code is removed.

Instead of manually managing sessions and transactions, we simply call:

```java
employeeRepository.save(employee);
```

Spring Data JPA automatically handles the session, transaction management, and SQL generation, making the code much cleaner and easier to maintain.

---

## Comparison

| JPA                           | Hibernate                           | Spring Data JPA                                         |
| ----------------------------- | ----------------------------------- | ------------------------------------------------------- |
| Specification                 | Implementation of JPA               | Framework built on top of JPA                           |
| Defines rules for persistence | Performs actual database operations | Simplifies Hibernate and reduces boilerplate code       |
| No implementation             | ORM framework                       | Uses repositories like `JpaRepository`                  |
| Does not manage transactions  | Manual transaction handling         | Automatic transaction management using `@Transactional` |

---

## Conclusion

From this hands-on, I understood that:

* **JPA** provides the rules and specifications for object-relational mapping.
* **Hibernate** implements those rules and performs the actual database operations.
* **Spring Data JPA** builds on top of Hibernate and simplifies development by reducing boilerplate code and providing ready-made repository methods.

I also understood why Spring Data JPA is widely used in real-world applications—it makes the code cleaner, easier to maintain, and allows developers to focus on business logic instead of database management.
