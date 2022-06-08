import { IPets } from "../interfaces/pets.interface";

// Sample data
export const pets : IPets[] = [
  {
    petId: 1,
    name: "Doug the Pug",
    species : "Dog",
    breed: "Pug",
    displayPhoto: "https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
    gender: "MALE",
    age: 2,
    bio: "I'm Doug, a pug. I like to brag, tug, and shrug.",
    location: "Bulacan",
    photos: [
      {
        title: "photo1",
        description: "description1",
        mediaUrl: "https://images.unsplash.com/photo-1523626797181-8c5ae80d40c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"
      },
      {
        title: "photo2",
        description: "description2",
        mediaUrl: "https://images.unsplash.com/photo-1575425186775-b8de9a427e67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        title: "photo3",
        description: "description3",
        mediaUrl: "https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
      {
        title: "photo4",
        description: "description4",
        mediaUrl: "https://images.unsplash.com/photo-1517423440428-a5a00ad493e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80"
      },
      {
        title: "photo5",
        description: "description5",
        mediaUrl: "https://images.unsplash.com/photo-1523626752472-b55a628f1acc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"
      },
      {
        title: "photo6",
        description: "description6",
        mediaUrl: "https://images.unsplash.com/photo-1590634561459-a66450c49241?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=706&q=80"
      },
    ]
  },
  {
    petId: 2,
    name: "Kiefer",
    species : "Dog",
    breed: "Golden Retreiver",
    displayPhoto: "https://images.unsplash.com/photo-1552053831-71594a27632d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=662&q=80",
    gender: "MALE",
    age: 4,
    bio: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quibusdam, voluptatum accusantium ipsa doloremque modi similique itaque accusamus delectus, aut labore libero ullam fuga. Natus.",
    location: "Bulacan",
    photos: []
  },
  {
    petId: 3,
    name: "Margie",
    species : "Dog",
    breed: "Corgi",
    displayPhoto: "https://images.unsplash.com/photo-1612940960267-4549a58fb257?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    gender: "FEMALE",
    age: 1,
    bio: "I am Margie, a very beautiful Corgi.",
    location: "Quezon City",
    photos: []
  },
  {
    petId: 4,
    name: "Taylor",
    species : "Dog",
    breed: "Labrador Retreiver",
    displayPhoto: "https://images.unsplash.com/photo-1537204696486-967f1b7198c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    gender: "FEMALE",
    age: 2,
    bio: "Haters gonna hate, hate, hate, hate.",
    location: "Quezon City",
    photos: []
  },
  {
    petId: 5,
    name: "Seymour",
    species : "Dog",
    breed: "Pitbull",
    displayPhoto: "https://images.unsplash.com/photo-1620001796685-adf7110fe1a7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
    gender: "MALE",
    age: 5,
    bio: "I'm Seymour. I may look tough, but I'm actually a softy.",
    location: "Makati",
    photos: []
  }
]