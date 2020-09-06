#users = User.create([{name: "megan", email: "mlcomeau99@gmail.com", password: "password", zipcode: "97214", search_radius: 25}, {name:"paul", email:"wmind24@hotmail.com", password: "bruce", zipcode: "97214", search_radius: 10}])

search = Search.create({user_id: 1, animal: "dog", gender: "male", age: "any", size: "small"})