# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

University.create!([{
                     name: 'Universidad Catolica',
                     descripcion: 'Descipcion universidad Catolica'
                   },
                    {
                      name: 'Universidad de Chile',
                      descripcion: 'Descipcion universidad de Chile'
                    },
                    {
                      name: 'Universidad Autonoma',
                      descripcion: 'Descipcion universidad Autonoma'
                    }])

User.create!([{
               email: 'admin@domain.com',
               username: 'Admin_site',
               password: 'admin123',
               password_confirmation: 'admin123',
               university_id: 1
             },
              {
                email: 'supervisor@domain.com',
                username: 'supervisor',
                password: 'supervisor123',
                password_confirmation: 'supervisor123',
                university_id: 2
              },
              {
                email: 'user@domain.com',
                username: 'user',
                password: 'user123',
                password_confirmation: 'user123',
                university_id: 3
              }])

Role.find_by(user_id: 1).update(superadmin_role: true)
Role.find_by(user_id: 2).update(supervisor_role: true)

Major.create!([{
                nombre: 'Medicina',
                university_id: 1
              },
               {
                 nombre: 'Ingenieria',
                 university_id: 2
               },
               {
                 nombre: 'Psicologia',
                 university_id: 3
               }])

Course.create!([{
                 name: 'Algebra'
               },
                {
                  name: 'Ingles'
                },
                {
                  name: 'Fisica'
                }])

Post.create!([{
               title: 'primer post',
               body: 'Cuerpo primera publicacion',
               user_id: 1,
               course_id: 1,
               major_id: 1,
               status: 'published'
             },
              {
                title: 'segundo post',
                body: 'Cuerpo segunda publicacion',
                user_id: 2,
                course_id: 2,
                major_id: 2,
                status: 'published'
              },
              {
                title: 'tercer post',
                body: 'Cuerpo tercera publicacion',
                user_id: 3,
                course_id: 3,
                major_id: 3,
                status: 'published'
              }])

Review.create!([{
                 course_id: 1,
                 major_id: 1
               },
                {
                  course_id: 2,
                  major_id: 2
                },
                {
                  course_id: 3,
                  major_id: 3
                }])
