import { graphql } from 'gatsby';
import React from 'react';
import Layout from '../pages/components/Layout';
import Img from "gatsby-image";
import * as styles from "../styles/project-details.module.css"

export default function ProjectDetails({ data }) {
    const { html } = data.markdownRemark;
    const { title, stack, featuredImg } =data.markdownRemark.frontmatter;
    
    return (
        <Layout>
            <div className={styles.details}>
                <h2>{title}</h2>
                <h3>{stack}</h3>
                <div className={styles.featured}>
                <Img fluid={featuredImg.childImageSharp.fluid}/>
                </div>
                <div dangerouslySetInnerHTML={{ __html: html }} className={styles.html}/>
            </div>
        </Layout>
    )
}

export const query = graphql`
query ProjectDetails($slug: String) {
    markdownRemark(frontmatter: {slug: {eq: $slug}}) {
      html
      frontmatter {
        stack
        title
        featuredImg {
          childImageSharp {
            fluid {
                ...GatsbyImageSharpFluid
            }
          }
        }
      }
    }
  }`