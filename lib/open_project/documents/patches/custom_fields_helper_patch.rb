#-- copyright
# OpenProject Documents Plugin
#
# Former OpenProject Core functionality extracted into a plugin.
#
# Copyright (C) 2009-2014 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.rdoc for more details.
#++

module OpenProject::Documents::Patches
  module CustomFieldsHelperPatch
    def self.included(base)

      base.class_eval do

        def custom_fields_tabs_with_documents
          custom_fields_tabs_without_documents << {
            name: 'DocumentCategoryCustomField',
            partial: 'custom_fields/tab',
            label: DocumentCategory::OPTION_NAME
          }
        end

        alias_method_chain :custom_fields_tabs, :documents
      end

    end

  end
end

unless CustomFieldsHelper.included_modules.include?(OpenProject::Documents::Patches::CustomFieldsHelperPatch)
  CustomFieldsHelper.send(:include, OpenProject::Documents::Patches::CustomFieldsHelperPatch)
end
