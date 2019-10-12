labor_disponibilities = LaborDisponibility.create([
    { description: "Disponibilidad inmediata"},
    { description: "Disponible, pero no para iniciar inmediatamente"},
    { description: "No estoy disponible"}
])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

