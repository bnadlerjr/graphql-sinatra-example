# frozen_string_literal: true

module GqlHelpers
  def build_gql(query, **kwargs)
    template = gql_data[query.to_s]
    kwargs.empty? ? template : (template % kwargs)
  end

  def gql_data
    @gql_data ||= YAML.load_file(File.join(__dir__, 'gql.yml'))
  end
end
