// app/javascript/components/EasyBlocksComponents.jsx
import React from 'react'

export function DummyBanner(props) {
  const { Root, Title } = props;
  return (
    <Root.type {...Root.props}>
      <Title.type {...Title.props} />
    </Root.type>
  );
}