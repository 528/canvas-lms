#
# Copyright (C) 2011 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../views_helper')

describe "/quizzes/quizzes/_quiz_right_side" do
  before :once do
    Account.default.enable_feature!(:draft_state)
  end

  it "should render" do
    course_with_student
    view_context
    assigns[:quiz] = @course.quizzes.create!
    render :partial => "quizzes/quizzes/quiz_right_side"
    expect(response).not_to be_nil
  end
end

