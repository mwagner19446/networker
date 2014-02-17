# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Task.delete_all
Connection.delete_all
Liuser.delete_all

mw = User.create(name: "Michael Wagner", title: "Business Analyst", photo_url: "http://m.c.lnkd.licdn.com/media/p/3/000/103/00b/2690744.jpg", password: "winner", password_confirmation: "winner", email: "michael.k.wagner@gmail.com", superuser: true)
sj = User.create(name: "Sam Jones", title: "Director, Engineering", photo_url: "http://m.c.lnkd.licdn.com/mpr/mpr/shrink_200_200/p/4/000/155/086/1b58479.jpg", password: "password", password_confirmation: "password", email: "joanna.giordano@gmail.com")

ja = Liuser.create(linkedin_id: "bRx1Qvk1xt", first_name: "Jason", last_name: "Adamek", headline: "Corporate Actions and Dividends Manager at LPL Financial", industry: "Financial Services", picture_url: "http://m.c.lnkd.licdn.com/mpr/mprx/0_M5umg6I0q-yAnLK2cTojgkgpNAd3nLA2RFZAgkRawqjAWT6uz_yC1X7hsxWOzGrhZQmKtiLQ8DDJ")
ab = Liuser.create(linkedin_id: "_Vi2TQDoHV", first_name: "Aamir", last_name: "Basheer", headline: "Director of Business Analytics at LearnVest", industry: "Internet", picture_url: "http://m.c.lnkd.licdn.com/mpr/mprx/0_A8PuXPp1t7nlBBOnlCz0Xrp1ru-xB-OnPTb1XrfhfW67end9gQ_8EKUaOGt8qz0sr_ltIBlEsZ3p")
ak = Liuser.create(linkedin_id: "-e5Lqypqy4", first_name: "Alayne", last_name: "Kleinman", headline: "Office Manager for Executive Search Firm ", industry: "Staffing and Recruiting", picture_url: "http://m.c.lnkd.licdn.com/mpr/mprx/0_goVSNvVI9Cc3oX2jxfZtN9dqnLTGEGpjxea-N9sqW6v-vQIgA2oTVnaVZS3jdLjAyd4PUlHdokmd ")
nm = Liuser.create(linkedin_id: "Q36Ncnd3Ob", first_name: "Navin", last_name: "Maheshwari", headline: "Onsite Tech Lead at Birlasoft ", industry: "Computer Software", picture_url: " ")
lf = Liuser.create(linkedin_id: "Y_KKpGh3lG", first_name: "Laurent", last_name: "Frecon", headline: "Venture Capital & Private Equity", industry: "Venture Capital & Private Equity", picture_url: "http://m.c.lnkd.licdn.com/mpr/mprx/0_Y5gdzlZtbTzmNex-pLmVz-s-bhKGnDO-yFWnz-ZCZLk1WWdt-_SLUt2uWmrpzo0OxQxcVv6KqbPE")
kg = Liuser.create(linkedin_id: "Yp9Gu1eWXl", first_name: "Kean", last_name: "Gardner", headline: "Account Management, Process and Project Management", industry: "Internet", picture_url: "http://m.c.lnkd.licdn.com/mpr/mprx/0_r9mLMnK-HQcYtua7rq29MzlrX65lrEa7tAssMzKfRilTfaJfyrYdcvX3oeLmPSf_AzuRntCPgsQl")


Task.create(title: "Meetup: Big Data", t_type: "Discovery", notes: "Pass out cards", due_date: Time.now+10.days, user: mw)
Task.create(title: "Meetup: Lean Startup", t_type: "Discovery", notes: "Eat Pizza", due_date: Time.now+11.days, user: mw)
Task.create(title: "Lunch: Jeff", t_type: "Radar", notes: "Ask about jobs in Analytics", due_date: Time.now+12.days, user: mw)
Task.create(title: "Pro Bono:  Wordpress for Animal Shelter", t_type: "Service", notes: " ", due_date: Time.now+14.days, user: sj)

Connection.create(name: "Jason A", c_type: "Connector", user: mw, liuser: ja)
Connection.create(name: "Aamir B", c_type: "Mentor", user: mw, liuser: ab)
Connection.create(name: "Alayne", c_type: "Peer", user: mw, liuser: ak )
Connection.create(name: "Navin M", c_type: "Connector", user: sj, liuser: nm)
Connection.create(name: "Laurent F", c_type: "Mentor", user: sj, liuser: lf)
Connection.create(name: "Kean G", c_type: "Peer", user: sj, liuser: kg )
