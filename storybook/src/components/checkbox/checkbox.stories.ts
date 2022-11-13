import { html } from 'lit-html';
import { ArgTypes } from '@storybook/web-components';

import results from '../../../.jest-test-results.json';
import { withTests } from '@storybook/addon-jest';

import { userEvent, waitFor, within } from '@storybook/testing-library';

//import docs from './my-component.docs.mdx';
import { Checkbox } from './checkbox';
import { setPlatformHelpers } from '@stencil/core';

export default {
  title: 'Components/Checkbox',
  component: 'zenit-checkbox',
  decorators: [withTests({ results })],
  parameters: {
    docs: {
      //page: docs
    }
  },
  argTypes: {
    value: {
      name: "Checked",
      type: {
        name: "enum",
        value: [
          "on",
          "off",
          "mixed"
        ],
        required: true
      },
      defaultValue: "on",
      description: "Whether the checkbox is checked; also, if it is in an indeterminate state."
    },
    tristate: {
      name: "Tri-state",
      type: 'boolean',
      defaultValue: false,
      description: "Whether the checkbox should cycle off, indeterminate, on, off."
    },
    disabled: {
      type: 'boolean',
      name: 'Disabled',
      defaultValue: false,
      description: "Whether the checkbox should be indicated as clickable."
    }
  } as ArgTypes<Checkbox>
}

const Template = ({value, tristate, disabled}) => html`<zenit-checkbox value=${value} ?tristate=${tristate} ?disabled=${disabled} />`;

export const Off = Template.bind({});
Off.args = {value: "off"};

export const On = Template.bind({});
On.args = {value: "on"};

function sleep(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export const Tristate = Template.bind({});
Tristate.args = {value: "off", tristate: true};
Tristate.storyName = "Cycle all three states";
Tristate.play = async ({ canvasElement }) => {
  const canvas = within(canvasElement);

  await sleep(1000);
  await userEvent.click(canvas.getByRole("checkbox"));
  await sleep(1000);
  await userEvent.click(canvas.getByRole("checkbox"));
  await sleep(1000);
  await userEvent.click(canvas.getByRole("checkbox"));
}

export const IndeterminateState = Template.bind({});
IndeterminateState.args = {value: "mixed"};

export const Disabled = Template.bind({});
Disabled.args = {value: "on", disabled: true};