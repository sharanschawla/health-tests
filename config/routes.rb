Rails.application.routes.draw do
  # Routes for the Blood test resource:

  # CREATE
  post("/insert_blood_test", { :controller => "blood_tests", :action => "create" })

  # READ
  get("/blood_tests", { :controller => "blood_tests", :action => "index" })

  get("/blood_tests/:path_id", { :controller => "blood_tests", :action => "show" })

  # UPDATE

  post("/modify_blood_test/:path_id", { :controller => "blood_tests", :action => "update" })

  # DELETE
  get("/delete_blood_test/:path_id", { :controller => "blood_tests", :action => "destroy" })

  #------------------------------

  devise_for :users
  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:
  # get("/your_first_screen", { :controller => "pages", :action => "first" })

  get("/", {:controller =>"blood_tests", :action=>"index"})
  
end
