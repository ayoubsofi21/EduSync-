Documentation expliquant les choix de relations (1:1, 1:N, N:N).
users → roles (1:N)
Un rôle peut avoir plusieurs utilisateurs, mais un utilisateur a un seul rôle.
users → students (1:1)
Un utilisateur correspond à un seul étudiant.
classes → students (1:N)
Une classe contient plusieurs étudiants, mais chaque étudiant appartient à une seule classe.
users (prof) → courses (1:N)
Un professeur peut enseigner plusieurs cours, mais chaque cours a un seul professeur.
students → courses (N:N)
Un étudiant peut suivre plusieurs cours et un cours peut avoir plusieurs étudiants → via enrollments.
