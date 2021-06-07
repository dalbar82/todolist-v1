import React from "react";
import Layout from "./components/Layout";
import * as styles from "../styles/home.module.css"
import { graphql, Link } from "gatsby";
import { StaticImage } from "gatsby-plugin-image"

export default function Home( { data }) {
  return (
    <Layout>
    <section className={styles.header}>
      <div>
      <h2>Design</h2>
      <h3>Develop and Deploy</h3>
      <p>Web design and development based in Woodend.</p>
      <Link className={styles.btn} to="/projects">My Portfolio Projects</Link>
      </div>
      <div className="homeBanner">
      <StaticImage
     src="../images/banner.png"
     alt="A dinosaur"
     placeholder="blurred"
   />
   </div>
    </section>
    </Layout>
  )
}


export const query = graphql`query Banner {
  file(relativePath: {eq: "banner.png"}) {
    childImageSharp {
      gatsbyImageData(layout: FULL_WIDTH)
    }
  }
}
`