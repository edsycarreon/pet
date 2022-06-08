INSERT INTO person (
  person_id,
  first_name,
  last_name,
  email,
  password,
  status,
  gender,
  phone_number,
  created_by
) VALUES (
  1,
  'Eurika',
  'Navarro',
  'eurikanavarro@gmail.com',
  '$2b$10$0Z3uk6Nl3SAorLw/zH8/p.8XkOgGC/hqkOL4R31IWbHmNCKYflBlO',
  'ACT',
  'FEM',
  '09362326307',
  1
);

INSERT INTO pet (pet_id, person_id, name, bio, species, breed, age, gender, location, display_photo, created_by) 
VALUES (
  1,
  1,
  'Doug the Pug',
  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quibusdam, voluptatum accusantium ipsa doloremque modi similique itaque accusamus delectus, aut labore libero ullam fuga. Natus.',
  'DOG',
  'Pug',
  2,
  'MAL',
  'Bulacan',
  'https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
  1
);

INSERT INTO pet (pet_id, person_id, name, bio, species, breed, age, gender, location, display_photo, created_by) 
VALUES (
  2,
  1,
  'Kiefer',
  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quibusdam, voluptatum accusantium ipsa doloremque modi similique itaque accusamus delectus, aut labore libero ullam fuga. Natus.',
  'DOG',
  'Golden Retreiver',
  4,
  'MAL',
  'Bulacan',
  'https://images.unsplash.com/photo-1552053831-71594a27632d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=662&q=80',
  1
);

INSERT INTO pet (pet_id, person_id, name, bio, species, breed, age, gender, location, display_photo, created_by) 
VALUES (
  3,
  1,
  'Margie',
  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quibusdam, voluptatum accusantium ipsa doloremque modi similique itaque accusamus delectus, aut labore libero ullam fuga. Natus.',
  'DOG',
  'Corgi',
  1,
  'FEM',
  'Quezon City',
  'https://images.unsplash.com/photo-1612940960267-4549a58fb257?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  1
);

INSERT INTO pet (pet_id, person_id, name, bio, species, breed, age, gender, location, display_photo, created_by) 
VALUES (
  4,
  1,
  'Taylor',
  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quibusdam, voluptatum accusantium ipsa doloremque modi similique itaque accusamus delectus, aut labore libero ullam fuga. Natus.',
  'DOG',
  'Labrador Retreiver',
  2,
  'FEM',
  'Quezon City',
  'https://images.unsplash.com/photo-1537204696486-967f1b7198c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  1
);

INSERT INTO pet (pet_id, person_id, name, bio, species, breed, age, gender, location, display_photo, created_by) 
VALUES (
  5,
  1,
  'Seymour',
  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quibusdam, voluptatum accusantium ipsa doloremque modi similique itaque accusamus delectus, aut labore libero ullam fuga. Natus.',
  'DOG',
  'Pitbull',
  5,
  'MAL',
  'Makati',
  'https://images.unsplash.com/photo-1620001796685-adf7110fe1a7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  1
);

INSERT INTO pet_photo(pet_photo_id, pet_id, title, description, media_url, created_by)
VALUES(
  1,
  1,
  'photo1',
  'description1',
  'https://images.unsplash.com/photo-1523626797181-8c5ae80d40c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
  1
);

INSERT INTO pet_photo(pet_photo_id, pet_id, title, description, media_url, created_by)
VALUES(
  2,
  1,
  'photo2',
  'description2',
  'https://images.unsplash.com/photo-1575425186775-b8de9a427e67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  1
);

INSERT INTO pet_photo(pet_photo_id, pet_id, title, description, media_url, created_by)
VALUES(
  3,
  1,
  'photo3',
  'description3',
  'https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  1
);

INSERT INTO pet_photo(pet_photo_id, pet_id, title, description, media_url, created_by)
VALUES(
  4,
  1,
  'photo4',
  'description4',
  'https://images.unsplash.com/photo-1517423440428-a5a00ad493e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
  1
);

INSERT INTO pet_photo(pet_photo_id, pet_id, title, description, media_url, created_by)
VALUES(
  5,
  1,
  'photo5',
  'description5',
  'https://images.unsplash.com/photo-1523626752472-b55a628f1acc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
  1
);

INSERT INTO pet_photo(pet_photo_id, pet_id, title, description, media_url, created_by)
VALUES(
  6,
  1,
  'photo6',
  'description6',
  'https://images.unsplash.com/photo-1590634561459-a66450c49241?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=706&q=80',
  1
);