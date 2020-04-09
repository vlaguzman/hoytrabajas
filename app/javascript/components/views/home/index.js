import React from 'react'
import PropTypes from 'prop-types'
import CoverSection from './sections/cover'
import OffersSection from './sections/offers'
import CompaniesSection from './sections/companies'
import JobCategories from './sections/JobCategories'
import Banner from './sections/Banner'
import SearchTrends from './sections/SearchTrends'
import PostList from './sections/PostList'
import Steps from './sections/Steps'
import Newsletter from './sections/Newsletter'
import content from './data'
import useWindowSize from '../../src/hooks/useWindowSize'

const HomePage = ({
  offers = [],
  csrf_param,
  csrf_token,
  offers_path,
  path_applied_offers,
  new_offer_path,
  home_translations,
  offer_translations,
  advanced_search_translations,
  filterForm,
  searchTrendsParams,
  categoriesAttributesList,
  common
}) => {
  const { companies } = content
  const {
    cover,
    offers: offersTranslations,
    categories,
    info,
    search_trends,
    post_list,
    affiliates,
    newsletter,
    steps
  } = home_translations
  const windowSize = useWindowSize()

  return (
    <div className="home-wrapper">
      <CoverSection
        {...{ categoriesAttributesList, filterForm }}
        translations={cover}
        advanced_search_translations={advanced_search_translations}
        new_offer_path={new_offer_path}
      />
      <OffersSection
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        offers={offers}
        path_applied_offers={path_applied_offers}
        section_title={offersTranslations.title}
        offer_translations={offer_translations}
        offers_path={offers_path}
      />
      <JobCategories categories={categoriesAttributesList} translations={categories} />
      <Banner translations={info} />
      <SearchTrends translations={search_trends} searchTrendsParams={searchTrendsParams} />
      <Steps translations={steps} />
      {/* TODO: Uncomment when landing pages has been defined */}
      {/* <PostList translations={post_list} /> */}
      <CompaniesSection translations={affiliates} {...companies} />
      {/* TODO: use when we have the newsletter working right */}
      {/* <Newsletter
        translations={newsletter}
        csrf_param={csrf_param}
        csrf_token={csrf_token}
      /> */}
    </div>
  )
}

export default HomePage

HomePage.propTypes = {
  path_applied_offers: PropTypes.string.isRequired,
  new_offer_path: PropTypes.string.isRequired,
  offers: PropTypes.object.isRequired,
  csrf_param: PropTypes.string,
  csrf_token: PropTypes.string,
  offers_path: PropTypes.string,
  home_translations: PropTypes.object.isRequired,
  offer_translations: PropTypes.object,
  advanced_search_translations: PropTypes.object.isRequired,
  common: PropTypes.object,
  filterForm: PropTypes.object,
  searchTrendsParams: PropTypes.object
}
