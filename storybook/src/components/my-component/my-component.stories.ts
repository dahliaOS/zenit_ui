import { html, nothing } from 'lit-html';
import { Components } from '../../components';
import { ArgTypes } from '@storybook/web-components';

//@ts-ignore
import docs from './my-component.docs.mdx';
import { MyComponent } from './my-component';

export default {
  title: 'Components/Demo Component',
  component: 'my-component',
  parameters: {
    docs: {
      page: docs
    }
  },
  argTypes: {
    first: {
      type: 'string',
      name: 'First name',
      description: 'The first name'
    },
    middle: {
      type: 'string',
      name: 'Middle name',
      description: 'The middle name'
    },
    last: {
      type: 'string',
      name: 'Last name',
      description: 'The last name'
    }
  } as ArgTypes<MyComponent>
};

const Template = (args: Components.MyComponent) => html`<my-component
  first=${args.first || nothing}
  middle=${args.middle || nothing}
  last=${args.last || nothing} 
/>`;

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