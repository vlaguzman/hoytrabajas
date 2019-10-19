labor_disponibilities = LaborDisponibility.create([
    { description: "Disponibilidad inmediata"},
    { description: "Disponible, pero no para iniciar inmediatamente"},
    { description: "No estoy disponible"}
])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Sex.create!(description: 'Masculino') if Rails.env.development?
Sex.create!(description: 'Femenino') if Rails.env.development?
ContractType.create!(description: 'Prestacion de servicios') if Rails.env.development?
DocumentType.create!(description: 'CC') if Rails.env.development?
WorkMode.create!(description: 'Teletrabajo') if Rails.env.development?
EducationalDegree.create!(description: 'Bachiller') if Rails.env.development?
City.create!(description: 'Bogota') if Rails.env.development?
EmployeesRange.create!(description: '10 - 20') if Rails.env.development?
Company.create!(name: 'HoyTrbajas.com', employees_range_id: 1, city_id: 1) if Rails.env.development?
JobCategory.create!(description: 'ventas') if Rails.env.development?
OfferType.create!(description: 'Trabajo tiempo completo') if Rails.env.development?
