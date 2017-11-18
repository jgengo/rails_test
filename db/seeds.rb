50.times do 
  Rental.create(status: :incoming, created_at: Time.zone.now - 6.days, updated_at: Time.zone.now - 6.days)
end

Rental.create([
  { status: :incoming, created_at: Time.zone.now - 5.days, updated_at: Time.zone.now - 5.days },
  { status: :incoming, created_at: Time.zone.now - 4.days, updated_at: Time.zone.now - 4.days },
  { status: :incoming, created_at: Time.zone.now - 1.days, updated_at: Time.zone.now - 1.days },
  { status: :incoming, created_at: Time.zone.now - 3.hours, updated_at: Time.zone.now - 3.hours }
])