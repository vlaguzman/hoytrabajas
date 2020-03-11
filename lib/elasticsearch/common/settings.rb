module Elasticsearch::Common::Settings

  ES_FILTER_TYPES = ["nGram", "custom"]
  ES_FILTER = ["lowercase", "standard", "asciifolding"]
  ES_TOKENIZERS = ["standard"]

  COMMON_NGRAM_FILTER = {
    type: ES_FILTER_TYPES[0],
    min_gram: 2,
    max_gram: 50
  }

  COMMON_INDEX_ANALIZER = {
    type: ES_FILTER_TYPES[1],
    tokenizer: :standard,
    filter: [ ES_FILTER[0], :common_ngram_filter ]
  }

  COMMON_SEARCH_ANALYZER = {
    type: ES_FILTER_TYPES[1],
    tokenizer: ES_TOKENIZERS[0],
    filter: [ ES_FILTER[0], ES_FILTER[1], :common_ngram_filter ]
  }

  COMMON_ASCII_ANALIZER = {
    tokenizer: ES_TOKENIZERS[0],
    filter: ES_FILTER[1]
  }

  def self.call(aditional_analysis:{}, aditional_filters: {})
    index_builder(aditional_analysis: aditional_analysis, aditional_filters: aditional_filters)
  end

  def self.index_builder(aditional_analysis: {}, aditional_filters: {})
    {
      analysis: analysis_builder(aditional_analysis: aditional_analysis, aditional_filters: aditional_filters)
    }
  end

  def self.analysis_builder(aditional_analysis: {}, aditional_filters: {})
    {
      index_analyzer:  { common_index_analizer:  COMMON_INDEX_ANALIZER },
      search_analyzer: { common_search_analyzer: COMMON_SEARCH_ANALYZER },
      ascii_analizer:  { common_ascii_analyzer: COMMON_ASCII_ANALIZER },
      filter: filter_builder(aditional_filters: aditional_filters)
    }.merge(aditional_analysis)
  end

  def self.filter_builder(aditional_filters: {})
    { common_ngram_filter: COMMON_NGRAM_FILTER }.merge(aditional_filters)
  end

end
