module ApplicationHelper
  # global varialbe for select choices
  $CHECK_TYPE= ['Validation', 'Derivation']
  $CHECK_METHOD = ['Auto','Manual']
  $REVIEW_TYPE = ['Inv Review', 'DM Review', 'CRA Review']

  def domain_list
    @domain_list = Domain.all
    render :partial => "cells/domain_list"
  end

  def get_comments(obj)
    #@comments = obj.root_comments
    @comments = obj.comments_ordered_by_submitted.limit(5)
    render :partial => "comment/comments"
  end

  def comment_form(obj)
    #render comment form
    #params: model_name, will get controller if not supply
    #eg: comment_form('Dvp', 10)
    @model_name ||= obj.class.name
    @obj_id ||= obj.id
    #@comment = Comment.new
    render :partial => "comment/form"
  end

  def test_status_label(obj)
    #return different lable according to values 'Y','N','NA', others
    if obj == 'Y'
      raw('<span class="label label-mini label-success">Passed</span>')
    elsif obj == 'N'
      raw('<span class="label label-mini label-important">Failed</span>')
    else
      raw('<span class="label">Not Test</span>')
    end
  end
end
