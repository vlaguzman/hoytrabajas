import React from 'react'
import PropTypes from 'prop-types'
import CoverSection from './sections/cover'
import OffersSection from './sections/offers'
import CompaniesSection from './sections/companies'
import JobCategories from './sections/JobCategories'
import Banner from './sections/Banner'
import SearchTrends from './sections/SearchTrends'
import PostList from './sections/PostList'
import content from './data'

const HomePage = ({
  offers,
  csrf_param,
  csrf_token,
  path_applied_offers,
  new_offer_path,
  home_translations,
  offer_translations,
  filterForm,
  common
}) => {
  const { companies } = content
  const {
    cover,
    offers: offersTranslations,
    categories,
    info,
    search_trends,
    post_list
  } = home_translations

  return (
    <div className="home-wrapper">
      <CoverSection
        {...{ common, filterForm }}
        translations={cover}
        new_offer_path={new_offer_path}
      />
      <OffersSection
        csrf_param={csrf_param}
        csrf_token={csrf_token}
        offers={offers}
        path_applied_offers={path_applied_offers}
        section_title={offersTranslations.title}
        offer_translations={offer_translations}
      />
      {/* TODO any: uncomment sections when they have real data */}
      <JobCategories categories={common.categorias} translations={categories} />
      <Banner translations={info} />
      <SearchTrends translations={search_trends} />
      <PostList translations={post_list} />
      <CompaniesSection {...companies} />
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
  home_translations: PropTypes.object.isRequired,
  offer_translations: PropTypes.object,
  common: PropTypes.object,
  filterForm: PropTypes.object
}
