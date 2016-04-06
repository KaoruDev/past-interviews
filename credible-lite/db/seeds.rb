lenders = [
  { name: 'Lending Club', description: 'Lending Club is the world’s largest online marketplace connecting borrowers and investors. We’re transforming the banking system to make credit more affordable and investing more rewarding. We operate fully online and pass the cost savings on to borrowers and investors.' },
  { name: 'Prosper', description: 'Prosper is America\'s first peer-to-peer lending marketplace, with more than 2 million members and over $5 billion in funded loans. Prosper allows people to invest in each other in a way that is financially and socially rewarding. Individuals invest as little as $25 to fund loans for borrowers.' },
  { name: 'Pave', description: 'Based in New York City, we’re on a mission to remove a major obstacle young people face: access to affordable funding. We’re starting with the Pave loan. Our technology enables us to give young people the most affordable rate by looking beyond their credit score to who they are and where they’re going.' },
  { name: 'Avant', description: 'Avant is built from a team of passionate Chicagoans looking to change the online lending industry. Starting in 2012, our mission is to lower the barriers and costs of borrowing. Over 300,000 customers have been helped by transparent & convenient personal loans.' },
  { name: 'Upstart', description: 'At Upstart, we believe that you are more than your credit score. Your education and job history help us understand more about your future potential, and allow you to get a lower rate on personal loans.' },
  { name: 'Vouch', description: 'At Vouch, we help customers build a network of trusted friends and family – people who would vouch for them in times of need – creating a way of looking at creditworthiness that spans beyond your FICO score.'}
]

lenders.each do |lender_hash|
  puts "Creating Lender #{lender_hash[:name]}"
  Lender.find_or_create_by(name: lender_hash[:name]).update(description: lender_hash[:description])
end

puts "Creating Products for Lending Club"
lender = Lender.find_by_name("Lending Club")
lender.products.find_or_create_by(term: 12, min_credit_score: 660).update(min_income: 50000, apr: BigDecimal("12"))
lender.products.find_or_create_by(term: 16, min_credit_score: 660).update(min_income: 50000, apr: BigDecimal("14"))
lender.products.find_or_create_by(term: 24, min_credit_score: 680).update(min_income: 60000, apr: BigDecimal("18"))

puts "Creating Products for Prosper"
lender = Lender.find_by_name("Prosper")
lender.products.find_or_create_by(term: 8, min_credit_score: 620).update(min_income: 40000, apr: BigDecimal("10"))
lender.products.find_or_create_by(term: 12, min_credit_score: 660).update(min_income: 40000, apr: BigDecimal("12"))
lender.products.find_or_create_by(term: 24, min_credit_score: 680).update(min_income: 60000, apr: BigDecimal("17"))
lender.products.find_or_create_by(term: 36, min_credit_score: 700).update(min_income: 80000, apr: BigDecimal("20"))

puts "Creating Products for Pave"
lender = Lender.find_by_name("Pave")
lender.products.find_or_create_by(term: 16, min_credit_score: 660).update(min_income: 45000, apr: BigDecimal("15"))
lender.products.find_or_create_by(term: 24, min_credit_score: 680).update(min_income: 65000, apr: BigDecimal("19"))

puts "Creating Products for Avant"
lender = Lender.find_by_name("Avant")
lender.products.find_or_create_by(term: 12, min_credit_score: 720).update(min_income: 80000, apr: BigDecimal("10"))

puts "Creating Products for Upstart"
lender = Lender.find_by_name("Upstart")
lender.products.find_or_create_by(term: 10, min_credit_score: 720).update(min_income: 80000, apr: BigDecimal("10"))
lender.products.find_or_create_by(term: 20, min_credit_score: 720).update(min_income: 80000, apr: BigDecimal("16"))
lender.products.find_or_create_by(term: 30, min_credit_score: 720).update(min_income: 80000, apr: BigDecimal("18"))

puts "Creating Products for Vouch"
lender = Lender.find_by_name("Vouch")
lender.products.find_or_create_by(term: 12, min_credit_score: 600).update(min_income: 40000, apr: BigDecimal("15"))
lender.products.find_or_create_by(term: 24, min_credit_score: 620).update(min_income: 50000, apr: BigDecimal("20"))

puts "Done"