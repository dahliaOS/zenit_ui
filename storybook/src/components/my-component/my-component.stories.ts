import { html } from 'lit-html';

export default {
  title: 'Components/Demo Component',
};

const Template = ({first, middle, last}: {first: string, middle: string, last: string}) => html`<my-component first="${first}" middle="${middle}" last="${last}" />`;

export const JohnGreen = Template.bind({});
JohnGreen.args = {
  first: 'John',
  last: 'Green'
};
JohnGreen.storyName = 'John Green';

export const JJJS = Template.bind({});
JJJS.args = {
  first: 'John-Jacob',
  middle: 'Jingleheimer',
  last: 'Schmidt'
};
JJJS.storyName = 'John-Jacob Jingleheimer Schmidt';