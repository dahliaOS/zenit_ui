import { newSpecPage } from "@stencil/core/testing";
import { Button } from "./button";

describe('zenit-button', () => {
  it('renders', async () => {
    const { root } = await newSpecPage({
      components: [Button],
      html: '<zenit-button>Text</zenit-button>',
    });
    expect(root).toEqualHtml(`
      <zenit-button>
        <mock:shadow-root>
          <button>
            <slot></slot>
          </button>
        </mock:shadow-root>
        Text
      </zenit-button>
    `);
  });

  it('renders with primary class', async () => {
    const { root } = await newSpecPage({
      components: [Button],
      html: '<zenit-button primary>Primary</zenit-button>',
    });
    expect(root).toEqualHtml(`
      <zenit-button primary>
        <mock:shadow-root>
          <button class="zenit-primary">
            <slot></slot>
          </button>
        </mock:shadow-root>
        Primary
      </zenit-button>
    `);
  });

  it('renders as disabled', async () => {
    const { root } = await newSpecPage({
      components: [Button],
      html: '<zenit-button disabled>Veteran (we salute you)</zenit-button>',
    });
    expect(root).toEqualHtml(`
      <zenit-button disabled>
        <mock:shadow-root>
          <button disabled>
            <slot></slot>
          </button>
        </mock:shadow-root>
        Veteran (we salute you)
      </zenit-button>
    `);
  });
});