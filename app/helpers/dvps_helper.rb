module DvpsHelper
  def get_dvp_view
    if session[:dvp_view]
      session[:dvp_view]+"_listing"
    else
      "listing"
    end
  end
  def list_dvp_testings(obj)
    # DVP testings
    @records = obj.testings.order("created_at desc")
    if @records
      render :partial => "testings/testing_list", :locals => {:records => @records}
    end
  end

  def programmer_check(item)
    # item is @dvp object
    obj = item.program_status
    if obj == 'N' or obj.nil?
      if item.testings.last.test_passed_yn=='N'
        icon_style = raw("<strong> <i class='icon-check-empty'></i>!</strong>")
      else
        icon_style = raw("<i class='icon-check-empty'></i>")
      end
      render :partial => 'cda_form', :locals => {:item => item, :icon_style => icon_style}
    else
      raw("<i class='icon-check text-right'></i>")
    end
  end

  def tester_check(item)
    obj = item.test_status
    if item.program_status and (item.test_status.nil? or item.test_status.blank?)
#      link_to raw("<i class='icon-check-empty'></i>"),
#                     edit_testing_path(item.testings.last,
#                     :return_uri => request.path)
      if !item.testings[-2].nil?
        icon_style = raw("<strong> <i class='icon-check-empty'></i>!</strong>")
      else
        icon_style = raw("<i class='icon-check-empty'></i>")
      end
      render :partial => 'tester_form', :locals => {:item => item, :icon_style => icon_style}
    elsif obj == 'N'
      raw("<i class='icon-warning-sign text-error'></i>")
    elsif obj == 'Y'
      raw("<i class='icon-check'></i>")
    else
      raw("<i class='icon-check-empty'></i>")
    end
  end
end
