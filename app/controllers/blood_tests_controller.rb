class BloodTestsController < ApplicationController
  def index
    matching_blood_tests = current_user.blood_tests

    @list_of_blood_tests = matching_blood_tests.order({ :created_at => :desc })

    render({ :template => "blood_test_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_blood_tests = BloodTest.where({ :id => the_id })

    @the_blood_test = matching_blood_tests.at(0)

    render({ :template => "blood_test_templates/show" })
  end

  def create
    the_blood_test = BloodTest.new
    the_blood_test.user_id = current_user.id
    raw_file=params.fetch("query_bloodtest")
    @data_uri= DataURI.convert(raw_file)
   
    # the_blood_test.vitamin_d = params.fetch("query_vitamin_d")
    # the_blood_test.hba1c = params.fetch("query_hba1c")
    # the_blood_test.hdl = params.fetch("query_hdl")
    # the_blood_test.ldl = params.fetch("query_ldl")
    # the_blood_test.openai_conv_id = params.fetch("query_openai_conv_id")
    # the_blood_test.summary = params.fetch("query_summary")

    if the_blood_test.valid?
      the_blood_test.save
      redirect_to("/blood_tests/#{the_blood_test.id}", { :notice => "Blood test created successfully." })
    else
      redirect_to("/blood_tests", { :alert => the_blood_test.errors.full_messages.to_sentence })
    end
  end

  def itemize
    raw_file=params.fetch("receipt_image")
    @data_uri= DataURI.convert(raw_file)
    render({:template=>"blood_test_templates/show"})

  end


  def update
    the_id = params.fetch("path_id")
    the_blood_test = BloodTest.where({ :id => the_id }).at(0)

    the_blood_test.user_id = params.fetch("query_user_id")
    the_blood_test.vitamin_d = params.fetch("query_vitamin_d")
    the_blood_test.hba1c = params.fetch("query_hba1c")
    the_blood_test.hdl = params.fetch("query_hdl")
    the_blood_test.ldl = params.fetch("query_ldl")
    the_blood_test.openai_conv_id = params.fetch("query_openai_conv_id")
    the_blood_test.summary = params.fetch("query_summary")

    if the_blood_test.valid?
      the_blood_test.save
      redirect_to("/blood_tests/#{the_blood_test.id}", { :notice => "Blood test updated successfully." } )
    else
      redirect_to("/blood_tests/#{the_blood_test.id}", { :alert => the_blood_test.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_blood_test = BloodTest.where({ :id => the_id }).at(0)

    the_blood_test.destroy

    redirect_to("/blood_tests", { :notice => "Blood test deleted successfully." } )
  end
end
